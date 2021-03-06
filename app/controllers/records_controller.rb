class RecordsController < ApplicationController

	def index
		@user = current_user
		@records = @user.records
		@goals = @user.goals
		@sum = 0
		@record = Record.new
		@total_record = @records.sum(:amount)
		@total_goal = @goals.sum(:amount)
		@rankings = User.best_savers
		@profile_picture = @user.profile_picture
	
	end

	def show
		@user = current_user
		@record = current_user.records.find(params[:id])
	end

	def new
		@user = current_user
		@record = current_user.records.build
	end

	def create
		@user = current_user
		@record = current_user.records.build(record_params)
		
		if @record.save
			redirect_to user_record_path(@user, @record)
		else
			render :index
		end
	end

	def edit
		@user = current_user
		@record = current_user.records.find(params[:id])
	end

	def update
		@user = current_user
		@record = current_user.records.find(params[:id])
		if @record.update(record_params)
			redirect_to user_records_path
		else
			render :edit
		end
	end

	def destroy
		@user = current_user
		@record = @user.records.find(params[:id])

		@record.destroy
		redirect_to user_records_path
	end

	private
	def record_params
		params.require(:record).permit(:date, :amount, :description)
	end
end
