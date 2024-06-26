class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    if @contact.valid?
      return render :confirm, status: :unprocessable_entity
    else
      render :new
    end
  end

  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      ContactMailer.send_mail(@contact).deliver
      respond_to do |format|
        format.html { redirect_to done_contacts_path }
      end
    else
      flash[:alert] = '入力内容にエラーがあります。もう一度確認してください。'
      respond_to do |format|
        format.turbo_stream { render :new }
        format.html { render :new }
      end
    end
  end


  def done
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message, :phone_number)
  end
end
