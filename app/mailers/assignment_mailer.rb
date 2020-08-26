class AssignmentMailer < ApplicationMailer
   default :from => 'cflorom@trinitylife.org'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_email(user, link)
    @user = user
    @link = link
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
  
  def comment_email(user, subuser, link)
    @user = user
    @subuser = subuser
    @link = link
    mail( :to => @user.email,
    :subject => 'There is a new comment on your submission' )
  end
  
  def announcement_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'A new announcement has been posted' )
  end
  
end
