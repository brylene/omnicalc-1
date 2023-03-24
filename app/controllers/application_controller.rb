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
    @principal= params.fetch("user_pv").to_f
    # The number of periods, n, that we receive from the user is in years. 
    # Since we're calculating monthly payment we multiply it by 12.
    @n = @years * 12 
    @percentage = @apr/100
    # r in the formula is a percentage per period. 
    # One period is equal to one month. The apr we receive from the user is yearly.
    @r = @percentage/12
    @numerator = @r*(1 + @r)**@n
    @denominator = ((1 + @r)**(@n)-1)
    @payment = @principal*(@numerator / @denominator)
    @payment = @payment.to_s(:currency)

    render({ :template => "calculation_templates/payment_results.html.erb" })
  end
end
