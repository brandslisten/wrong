if defined? IRB
  module IRB
    class Context
      alias :original_evaluate :evaluate
      attr_reader :all_lines

      def evaluate(line, line_no)
        (@all_lines ||= "") <<line
        original_evaluate line, line_no
      end
    end
  end

  # include it in the top level too, since if you're using Wrong inside IRB that's probably what you want
  # include Wrong # This causes Object to have Wrong as ancestor. This makes Rails autoloading fail if your module is called Helpers since Wrong has such a module too.
end
