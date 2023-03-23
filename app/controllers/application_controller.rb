class ApplicationController < ActionController::Base
  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb" })
  end

  def calculate_square
    @num = params.fetch("number").to_f
    @square_of_num = @num ** 2
    render({ :template => "calculation_templates/square_results.html.erb" })
  end

  def calculate_random
    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = rand(@lower..@upper)

    render({ :template => "calculation_templates/rand_results.html.erb" })
  end

  def blank_rand_form
    render({ :template => "calculation_templates/rand_form.html.erb" })
  end

  def blank_root_form
    render({ :template => "calculation_templates/root_form.html.erb" })
  end

  def calculate_root
    @root = params.fetch("user_number").to_f
    @square_root_num = Math.sqrt(@root).to_f

    render({ :template => "calculation_templates/root_results.html.erb" })
  end

  def blank_payment_form
    render({ :template => "calculation_templates/payment_form.html.erb" })
  end

  def calculate_payment
    @apr = params.fetch("user_apr").to_f
    @years = params.fetch("user_years").to_i
    @principal = params.fetch("user_pv").to_f
    @payment = ((@apr / @years) * @principal)

    render({ :template => "calculation_templates/payment_results.html.erb" })
  end
end
