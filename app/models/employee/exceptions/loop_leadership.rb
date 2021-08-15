module Employee::Exceptions
  class LoopLeadership < StandardError
      def initialize(msg = I18n.t('errors.loop_leadership'))
        super(msg)
      end
  end
end
