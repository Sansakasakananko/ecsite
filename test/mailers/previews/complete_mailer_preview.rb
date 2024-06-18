class CompleteMailerPreview < ActionMailer::Preview
  def complete_mail
    CompleteMailer.('自身のメールアドレス')
  end
end
