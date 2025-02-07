function try_source -a file
    if test -r $file
        source $file
    end
end
