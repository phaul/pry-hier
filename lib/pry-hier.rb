require 'pry'
require 'tty-tree'

class Pry
  Commands.create_command 'hier' do
    description 'Shows descendants of a class: hier [Class|Module]'

    def process
      klass = WrappedModule.from_str(args[0])
      raise CommandError, 'class or module name required' unless klass
      print_tree_for(klass.wrapped)
    end

    def options(opt)
      opt.on :s, :include_singletons, 'Include singleton classes'
    end

    private

    def print_tree_for(klass)
      set_class_list
      tree = hash_for(klass)
      case tree
      when Hash then output.print TTY::Tree.new(tree).render
      else output.puts colour_name(klass)
      end
    end

    def hash_for(klass)
      children = children_of(klass).map(&method(:hash_for))
      colour_name(klass).yield_self do |name|
        children.empty? ? name : { name => children }
      end
    end

    def children_of(klass)
      @classes.select { |obj| obj.superclass == klass }
    end

    def colour_name(klass)
      Pry.config.color ? colorize_code(klass) : klass.inspect
    end

    def set_class_list
      @classes = ObjectSpace.each_object(Class).select do |obj|
        opts.include_singletons? || ! obj.singleton_class?
      end
    end
  end
end
