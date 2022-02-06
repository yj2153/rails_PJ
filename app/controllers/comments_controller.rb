class CommentsController < ApplicationController
  
    def create
       @borad = Board.find(params[:board_id]) 
       @comment = @borad.comments.create(comment_params)
       @comment.user_id  = current_user.id #or whatever is you session name
       @comment.save
       redirect_to board_path(@borad)
    end
    
    # DELETE /boards/1 or /boards/1.json
    def destroy
        @borad = Board.find(params[:board_id]) 
        @comment = @borad.comments.find(params[:id])
        authorize! :read, @comment
        @comment.destroy
        redirect_to board_path(@borad)
    end
    
    private 
    def comment_params
        params.require(:comment).permit(:comment)
        
    end
    
     
end
