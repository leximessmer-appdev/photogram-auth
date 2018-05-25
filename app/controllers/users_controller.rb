class UsersController < ApplicationController
  def index
    @users = User.all

    render("user_templates/index.html.erb")
  end

  def show
    @user = User.find(params.fetch("id_to_display"))

    render("user_templates/show.html.erb")
  end

  def new_form
    render("user_templates/new_form.html.erb")
  end

  def create_row
    @user = User.new

    @user.caption = params.fetch("caption")
    @user.image = params.fetch("image")
    @user.user_id = params.fetch("user_id")

    if @user.valid?
      @user.save

      redirect_to("/users", :notice => "user created successfully.")
    else
      render("user_templates/new_form.html.erb")
    end
  end

  def edit_form
    @user = User.find(params.fetch("prefill_with_id"))

    render("user_templates/edit_form.html.erb")
  end

  def update_row
    @user = User.find(params.fetch("id_to_modify"))

    @user.caption = params.fetch("caption")
    @user.image = params.fetch("image")
    @user.user_id = params.fetch("user_id")

    if @user.valid?
      @user.save

      redirect_to("/users/#{@user.id}", :notice => "user updated successfully.")
    else
      render("user_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @user = User.find(params.fetch("id_to_remove"))

    @user.destroy

    redirect_to("/users", :notice => "user deleted successfully.")
  end
end
