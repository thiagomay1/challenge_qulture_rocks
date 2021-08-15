module Employee::Exceptions
  class SubordinateNotFound < StandardError
      def initialize(msg = I18n.t('errors.subordinate_not_found'))
        super(msg)
      end
  end
end
