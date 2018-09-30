class UsersController < ApplicationController
    skip_before_action :authorize_request, only: :create

    def create
        user = User.create!(user_params)
        json_response({email: user.email,message: "Registrasi Berhasil anda bisa Login Sekarang"})
    end

    def update
        current_user.update(user_params)
        json_response({message: "Data Berhasil diubah"})
    end

    def me
        json_response(current_user)
    end

    private

    def user_params
        params.permit(
            :username,
            :email,
            :password,
            :birthdate,
            :cards,
            :addresses
        )
    end
    
end
