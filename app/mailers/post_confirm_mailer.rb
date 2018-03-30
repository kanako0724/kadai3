class PostConfirmMailer < ApplicationMailer
    def post_confirm_mail(post)
        @post = post
        mail to: @post.user.email,subject: "投稿完了しました"
    end
end
