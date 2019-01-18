#!/bin/sh
# chshlistgen.sh - Shell script to generate a table listing available cheat
# sheets in the repository
#
# chshlistgen.sh parses information from a text file named 'index'. Comments
# asserted into 'index' (those that start with a hash "#") explain how the file
# plays its role, so open 'index' and read them.


# src/ and index are required. Quit if missing.
if ! [ -d src ] || ! [ -f index ]; then
    echo "FATAL: src/ or index missing"
    exit 1
fi

# No cheat sheet = No table for you
if [[ -z $(ls src) ]]; then
    echo "FATAL: No cheat sheet found in src/"
    exit 2
fi

# TODO: Undo these lines if all the F entries have faulty values
printf "<!-- Generated with chshlistgen.sh -->\n\n"
printf "|Preview|Title|Description|Contributors|License|\n"
printf "|:---:|:---:|---|:---:|:---:|\n"

# Check for presence of Inkscape on the computer (at least in PATH). Inkscape
# will be lated used to export targeted SVGs to PNGs and PDFs with its command
# line options.
if [ -z $(command -v inkscape) ]; then
    echo "WARNING: Inkscape is not installed"
    echo "         The cheat sheet will not be converted to PNG and PDF formats"\
         "(if any isn't presented)"
    echo "         Resolve this by, either installing Inkscape or editing chshlistgen.sh"
fi

# =============================
# =       BEGIN PARSING       =
# =============================

#########################################################
#                       VARIABLES                       #
#                                                       #
# 1. $chsh_fname: Cheat sheet's file name, excluding    #
#    the file extension. Should be the same for all 3   #
#    formats: SVG, PNG, PDF.                            #
# 2. $chsh_title: Cheat sheet's title                   #
#    (default: Untitled)                                #
# 3. $chsh_author: Cheat sheet's original author        #
#    (default: Unnamed)                                 #
# 4. $chsh_contribs: Contributors (separated by a       #
#    comma). The value is then prepended with a comma   #
#    and a space and the concatenated value is then     #
#    appended after $chsh_author to be placed in the    #
#    Contributors column.                               #
# 5. $chsh_about: Short description of the cheat sheet  #
# 6. $chsh_lic_name: Cheat sheet's license's name       #
# 7. $chsh_lic_fname: Cheat sheet's license copy's      #
#    file name that can be found in LICENSES/           #
#                                                       #
# ----------------------------------------------------- #
#                                                       #
# 8. $ln: Current line (of file 'index') being read     #
# 9. $entry_val: Value of the current entry in 'index'  #
# 10. $preview: Path to preview image (SVG or PNG)      #
# 11. $pnglink: Markdown snippet that will be a link to #
#     the cheat sheet's PNG format in the rendered      #
#     result                                            #
# 12. $liclink: Inner Markdown snippet for the corres-  #
#     ponding cell in the License column. Created from  #
#     $chsh_lic_name and $chsh_lic_fname.               #
#                                                       #
#########################################################


cat index | while read ln
do
    if [[ -z $ln ]]; then
        [[ -z $chsh_fname ]] && continue

        # (Re-)assign values for certain variables

        [[ -z $chsh_title ]] && chsh_title="Untitiled"
        [[ -z $chsh_author ]] && chsh_author="Unnamed"
        [[ -n $chsh_contribs ]] && chsh_contribs=", $chsh_contribs"

        if [[ -n $(command -v inkscape) ]]; then
            ! [[ -f png/$chsh_fname.png ]] && \
                inkscape --export-png="png/$chsh_fname.png" src/$chsh_fname.svg &>/dev/null
            ! [[ -f pdf/$chsh_fname.pdf ]] && \
                inkscape --export-pdf="pdf/$chsh_fname.pdf" src/$chsh_fname.svg &>/dev/null
        fi

        # Set values and Markdown snippets

        if [[ -f png/$chsh_fname.png ]]; then
            preview="png/$chsh_fname.png"
            pnglink="-- [PNG](png/$chsh_fname.png)"
        else
            preview="src/$chsh_fname.svg"
            pnglink=""
        fi

        [[ -f pdf/$chsh_fname.pdf ]] \
            && pdflink="-- [PDF](pdf/$chsh_fname.pdf)" \
            || pdflink=""

        if [[ -n $chsh_lic_name ]]; then
            [[ -n $chsh_lic_fname ]] \
                && liclink="[$chsh_lic_name](LICENSES/$chsh_lic_fname)" \
                || liclink="$chsh_lic_name"
        else
            liclink="All Rights Reserved"
        fi

        # ===== PRINT ===== #

        printf "|<img width=\"300\" src=\"%s\" /><br />%s %s %s|%s|%s|**%s**%s|%s|\n" \
               "$preview" "[SVG](src/$chsh_fname.svg)" "$pnglink" "$pdflink" \
               "$chsh_title" "$chsh_about" "$chsh_author" "$chsh_contribs" \
               "$liclink"

        # Unset the chsh variables, move to the next cheat sheet's entries

        unset chsh_title chsh_about chsh_author chsh_contribs chsh_lic_name \
              chsh_lic_fname
    else
        # === PARSE ENTRIES' VALUES === #

        entry_val=$(echo -n $ln | cut -c 4-${#ln} 2> /dev/null)
        case ${ln:0:1} in
            "#") continue;;
            "F")
                ! [[ -f src/$entry_val.svg ]] \
                    && >&2 echo "ERROR: Cheat sheet not found: src/$entry_val.svg, ignoring" \
                    || chsh_fname=$entry_val
                ;;
            "T") chsh_title=$entry_val;;
            "A") chsh_author=$entry_val;;
            "D") chsh_about=$entry_val;;
            "C") chsh_contribs=$entry_val;;
            "L")
                [[ -z $chsh_lic_name ]] && chsh_lic_name=$entry_val && continue
                [[ -z $chsh_lic_fname ]] && [[ -f LICENSES/$entry_val ]] && \
                    chsh_lic_fname=$entry_val
                ;;
            *)
                >&2 printf "WARNING: Unrecognized field '${ln:0:1}', ignoring..."
        esac
    fi
done
