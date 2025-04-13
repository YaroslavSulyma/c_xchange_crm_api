module Common
  class Validate < BaseInteractor
    def call
      validation_result = result
      if validation_result.success?
        context.valid_params = validation_result.to_h
        context.status_code = :ok
      else
        context.fail!(errors: validation_result.errors, status_code: :unprocessable_entity)
      end
    end

    private

    def result
      validator_options = context.validator_options || {}
      context.class_validator.new(**validator_options).call(context.input_params.to_h)
    end
  end
end
