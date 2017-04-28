require 'curb'
require 'arg-parser'


class CurbParser

    include ArgParser::DSL

    purpose <<-EOT
        Purpose: To pass triplebyte
    EOT

    positional_arg :url, 'This is the URL positional arg'
    keyword_arg :method, 'method kwarg, default is GET',
        default: 'GET'

    keyword_arg :val_opt, 'This is a keyword arg with optional value',
        value_optional: 'maybe'

    flag_arg :save, 'save response to desktop'
    rest_arg :file_names, 'This is where we specify that remaining args will be collected in an array'


    def run
        if opts = parse_arguments
            # Do something with opts.my_positional_arg, opts.my_keyword_arg,
            # opts.flag, and opts.files
            # ...
            res = Curl::Easy.http_get(opts.url)
            puts res.body
        else
            show_help? ? show_help : show_usage
        end
    end

end

CurbParser.new.run
