class PoweradeController < ApplicationController
    
    def read
        @posts = Post.all
        
    end
    
    def write
        
        @isthere = 0
        
        post = Post.new
        post.post_username = params[:author_name]
        post.post_password = params[:password]
        post.post_content = params[:content]
        if params[:image_file] != nil
            image = MiniMagick::Image.open(params[:image_file].path)
            image.resize "250x250"
            post.my_image = image
            #post.my_image = params[:image_file]
            @isthere = 1
        else
            @isthere = 0
        end
        
        post.save
        
        redirect_to '/'
    end
    
    def delete
        @identi = params[:pwd]
        @what = 0;
        one_post = Post.find(params[:id])
        @username = one_post.post_username
        
        
        if @identi==one_post.post_password
            one_post.destroy    
            @what = 1;
        else
            @what = 0;
        end
        
        
    end
    
    def modify
        @one_post = Post.find(params[:id])
    end
    
    def update
        one_post = Post.find(params[:id])
        one_post.post_username = params[:new_username]
        one_post.post_content = params[:new_content]
        one_post.save
        
        redirect_to "/"
        
    end
    
    def write_reply
        r = Reply.new
        r.post_id = params[:post_id]
        r.content = params[:myreply]
        r.save
        
        redirect_to "/"
    end

    
    
end
