## Una pequeña animacion 
## daniel-rojsanch

library(magick)   ## para crear animaciones

## declaramos la funcion y algunos obejetos que nos seran de utilidad
f <- function(x) 4*(abs(x) + sqrt(2.2 - x^2)*sin(kk*x))  
t <- seq(-4, 6, length.out = 100)
k <- exp(t)
a <- sqrt(2.2)

## crear graficos seperpuestos 
png('corazon%02d.png')  

for(j in 2:100){
    kk <- k[1]
    plot(f, lwd = 2, col = "red", xlim = c(-a, a), ylim = c(-6, 9), 
    main = expression( 4*(abs(x) - sin(kx)*sqrt(2.2 - x^2)) ))
    grid(lwd = 3, col = rgb(.4, .6, .6, .2))
    
    for(i in seq(1,j)){
    kk <- k[i] 
    curve(f, add = T, lwd = 2, col = "red")}}

dev.off()

## unimos todo nuestos grafico
imgs <- list.files(getwd(), full.names = TRUE)
imgs <- imgs[ grep("png", imgs) ]
img_list <- lapply(imgs, image_read)
img_joined <- image_join(img_list)
img_animated <- image_animate(img_joined, fps = 10)
img_animated

## lo gardamos y elimianos lo que no necesitamos
image_write(img_animated, path = "corazon.gif", format = "gif")
file.remove(list.files(pattern=".png"))


