function check-cookbook-versions
    # Get version numbers to verify for each cookbook
    set --local to_verify (cat environments/production.rb |
    grep '=>' |
    tr -s ' ' |
    tr -d "'" |
    tr -d ',' |
    cut -d ' ' -f 2,5-)

    # For each cookbook, find its metadata.json file and verify the version using jq
    for cookbook in $to_verify
        set --local bookver (string split " " $cookbook)
        set --local metadata_f (find . -path "*cookbooks/$bookver[1]/metadata.json")
        if test 1 -ne (count $metadata_f)
            echo "❌ Multiple metadata_f files for $bookver[1]:"
            echo (string join "\n" $metadata_f)
            return 1
        end

        set --local metadata_v (jq -r '.version' < $metadata_f)
        if test $metadata_v != $bookver[2]
            echo "❌ Expected version $bookver[2] for $bookver[1], but found $version in
        metadata.json"
            return 1
        else
            echo "✅ $bookver[1] cookbook is set to version $bookver[2]"
        end
    end
end
