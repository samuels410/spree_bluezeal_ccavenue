module Spree
  class Ccavenue::PaymentMethod < Spree::PaymentMethod
    preference :merchant_id, :string
    preference :access_code, :string
    preference :encryption_key, :string

    def url
      'https://secure.ccavenue.com/transaction/transaction.do'
    end

    def auto_capture?
      true
    end

    def purchase(amount, source, options = {})
      Class.new do
        def success?;
          true;
        end

        def authorization;
          nil;
        end
      end.new
    end

    def provider_class
      Spree::Ccavenue::Transaction
    end

    def payment_source_class
      Spree::Ccavenue::Transaction
    end

    def method_type
      'ccavenue'
    end

  end

end