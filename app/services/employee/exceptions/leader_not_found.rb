module Employee::Exceptions
  class LeaderNotFound < StandardError
      def initialize(msg = I18n.t('errors.leader_not_found'))
        super(msg)
      end
  end
end
