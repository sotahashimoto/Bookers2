class UsersController < ApplicationController
before_action :authenticate_user!
  def index
  	@user = User.find(current_user.id)
  	@users = User.all
  	@book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
    flash[:success] = 'You have updated user successfully.'
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    flash[:success] = 'You have updated user successfully.'
  	if @user.update(user_params)
  	redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  	# ログイン中のユーザーの投稿のみ表示する為
  	# schema.rbのcreate_table "books", force: :cascade do |t|からとってきている
  	# ユーザー　の　データを全て持ってくる
  	@loginuserdate = @user.books
  end

private
  def user_params
    # permitデータの操作を許可、これ(カラム名)書かないと変更しても更新されない
    # 管理者画面とかを作成する時はここにカラム書いたらダメ、今の段階では全カラム記述
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end