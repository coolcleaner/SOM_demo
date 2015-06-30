clear all
close all



map_height=100;
map_width=100;

grid_height=10;
grid_width=10;

num_grid_height=floor(map_height/grid_height);
num_grid_width=floor(map_width/grid_width);


for ii=1:num_grid_width
    
    
    for jj=1:num_grid_height
       
       x_coord=(ii-1)*grid_width;
       y_coord=(jj-1)*grid_height;
       
       rand_color=rand(1,3);
       
       rectangle('Position',[x_coord,y_coord,grid_width,grid_height],'FaceColor',rand_color,'EdgeColor','none');
       hold on;
       
   end
    
    
end

daspect([1, 1 , 1])