require_relative 'formatter'

module JsonResume
  class FormatterLatex < Formatter
    def format_slashes(str)
      str.gsub!(/\\/, '\textbackslash')
      str.gsub!(/\{/, '\{')
      str.gsub!(/\}/, '\}')
    end

    def format_link(str)
      str.gsub!(/\[(.*?)\]\((.*?)\)/, '{\href{\2}{\color{see} \1}}')
    end

    def format_autolink(str)
      str.gsub!(/<<(\S*?)>>/, '{\color{see} \url{\1}}')
    end

    def format_emphasis(str)
      str.gsub!(/\b_(.+?)_\b/, '\textit{\1}')
      str.gsub!(/\*\*(.+?)\*\*/, '\textbf{\1}')
    end

    def format_superscripts(str)
      str.gsub!(/<sup>(.*?)<\/sup>/, '$^{\1}$')
      str.gsub!(/<sub>(.*?)<\/sub>/, '$_{\1}$')
    end

    def format_symbols(str)
      str.gsub!(/#/, '\#')
      str.gsub!(/\$/, '\$')
      str.gsub!(/&/, '\\\\&')
      str.gsub!(/\|/, '\textbar')
      str.gsub!(/%/, '\%')
      str.gsub!(/_/, '\_')
    end

    def format_string(str)
      format_slashes str
      format_link str
      format_autolink str
      format_emphasis str
      format_symbols str
      format_superscripts str
    end

    def format
      super

      self
    end
  end
end
