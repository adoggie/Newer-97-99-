proce draw
para row2,col2,wieth,tall
&&tall=1.2

@row2,col2 to row2,col2+wieth pen 1,8 color rgb(0,0,0,,,) 
@row2+tall,col2 to row2+tall,col2+wieth pen 1,8 color rgb(255,255,255,,,)
@row2,col2 to row2+tall,col2 pen 1,8 color rgb(0,0,0,,,)
@row2,col2+wieth to row2+tall+0.1,col2+wieth pen 1,8 color rgb(255,255,255,,,)
return
