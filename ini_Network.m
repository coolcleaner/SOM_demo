function Network_new= ini_Network(Network_old, coord, radius, value)


x_coord=coord(1);
y_coord=coord(2);



num_node=numel(Network_old);



for ii=1:num_node
    
    node_x_coord=Network_old(ii).coord(1,1);
    node_y_coord=Network_old(ii).coord(1,2);
    
    
    dist= sqrt( (x_coord-node_x_coord)^2 + (y_coord-node_y_coord)^2 );
    
    
    if dist < radius
    
        
        
        Network_old(ii).weight=value;
        
    end
      
end


Network_new=Network_old;