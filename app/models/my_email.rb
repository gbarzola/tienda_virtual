class MyEmail < ActiveRecord::Base
    validates_presence_of :email, message:"Te olvidaste del correo"
    validates_uniqueness_of :email, message:"Correo registrado"
    validates_format_of :email, with: Devise::email_regexp
    
    
    
end
