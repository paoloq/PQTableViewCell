PQTableViewCell
===============

PQTableViewCell is based on the logic behind [ABTableViewCell](https://github.com/enormego/ABTableViewCell/tree/4e9861651b827d5e4716e56c870a52a0c3ab2027). 

###How to use

Subclass PQTableViewCell, and use drawCellView: instead of drawRect: when you want to draw something on the cell.

I recommend to draw strings and images for a faster and smoother scrolling.

###Notes

PQTableViewCell removes all the original content, so there won't be a selected or highlighted status. You are free to implement the same logic in order to have a selectedView, as enormego's [ABTableViewCell](https://github.com/enormego/ABTableViewCell) does.
