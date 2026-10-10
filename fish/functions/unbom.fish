function unbom --wraps="sed -i '1s/^\\xEF\\xBB\\xBF//'"
    if test (count $argv) -eq 0
        echo "Usage: unbom <file>"
        echo "Removes UTF-8 BOM (U+FEFF) from the entire file."
        echo ""
        echo "It breaks emojis... :D"
        echo ""
        return 1
    end
    
    sed -i 's/\xEF\xBB\xBF//g' -- $argv
end
