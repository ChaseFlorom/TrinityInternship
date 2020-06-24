class AssignmentMailer < ApplicationMailer
   default :from => 'chaseflorom@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'A teacher has created a new assignment' )
  end

  def submission_email(user, subuser, link)
    
    @user = user
    @subuser = subuser
    @link = link
    mail( :to => @user.email,
    :subject => 'A student has submitted an assignment' )
  end
  
  def announcement_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'A new announcement has been posted' )
  end
  
end
