helpers do

 def valid_input?(input_field)
   params[:user][input_field] == nil || params[:user][input_field] == ""
 end

 def validation_fail
   if valid_input?(:email)
     @errors = Array.new(1, "Email must be present")
   elsif valid_input?(:password)
     @errors = Array.new(1, "Password must be present")
   end
 end

end
