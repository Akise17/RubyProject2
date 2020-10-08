class HomeController < ApplicationController
    def index
        @user = User.all

        render json: {
            values: @user,
            message: "Success",
        },status: 200
    end

    def show
        if @user.present?
            render json:{
                values: @user,
                message: "Success",
            },status: 200
        else
            render json:{
                values: "",
                message: "We can't found any data!",
            },status: 400
        end
    end

    def create
        # @data = User.all
        @user = User.new(user_param[:data])
        if @user.save
            render json:{
                values: @user,
                message: "Success!",
            },status: 201
        else
            render json:{
                values: @data,
                message: "Failed",
            },status: 400
        end
    end
end
