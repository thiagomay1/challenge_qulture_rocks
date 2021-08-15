module Employee::Exceptions
    class OtherCompanyEmployee < StandardError
      def initialize(msg = I18n.t('errors.other_company_employee'))
        super(msg)
      end
    end
end
