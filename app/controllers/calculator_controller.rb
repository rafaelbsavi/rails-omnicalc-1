class CalculatorController < ApplicationController
  
  def homepage
    render({ :template => "calculator_templates/homepage"})
  end

  def square_new
    render({ :template =>"calculator_templates/square_new"})
  end

  def square_results
    @the_num = params.fetch("number").to_f
    @the_result = @the_num ** 2
    render({ :template => "calculator_templates/square_results"})
  end

  def square_root_new
    render({ :template => "calculator_templates/square_root_new"})
  end

  def square_root_results
    @the_num = params.fetch("number_square_root").to_f
    @the_result = @the_num **(1.0/2)    
    render({:template => "calculator_templates/square_root_results"})
  end

  def payment_new
    render({ :template => "calculator_templates/payment_new"})
  end

  def payment_results
    @apr = params.fetch("apr").to_f
    @apr_month = (@apr / 100) / 12
    @num_years = params.fetch("num_years").to_f
    @num_months = @num_years * 12
    @principal = params.fetch("principal").to_f
    
    @numerator = @apr_month * @principal
    @denominator = 1 - ((1 + @apr_month) ** (-@num_months))

    @payment = @numerator / @denominator
    render({ :template => "calculator_templates/payment_results"})
  end

  def random_new
    render({ :template => "calculator_templates/random_new"})
  end

  def random_results
    @min = params.fetch("min").to_f
    @max = params.fetch("max").to_f
    @random_num = @min + rand * (@max - @min)  
    render({ :template => "calculator_templates/random_results"})
  end
  
end
