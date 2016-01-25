module Web::Controllers::Users

  module ParamsForUpdate

    def self.included( action )
      action.class_eval do
        params do
          param :user do
            param :email, presence: true, format: /@/
            param :password, presence: true, confirmation: true, size: (9...64)
            param :old_password, presence: true, size: (9...64)
          end
        end
        handle_exception ArgumentError => 400
      end
    end

  end

  module ParamsForCreate

    def self.included( action )
      action.class_eval do
        params do
          param :user do
            param :username, presence: true, format: /\A[A-z0-9_-]{4,64}\Z/
            param :email, presence: true, format: /@/
            param :password, presence: true, confirmation: true, size: (9...64)
          end
        end
      end
    end
  end

end