##Session 8: May-22/2025 (Anusha)
getwd()

#To create plots we need ggplot2 library_install ggplot2
library(tidyverse)
library(ggplot2)

#run the readily available inbuilt dataframes
mtcars
iris


#syntax
ggplot(data=mtcars, aes(x= disp, y=hp) )
#similar pipe opearaotor + works here

tibble(age= c(12, 21, 32, 43, 11),
       height= c(160, 150, 149, 123, 170))->df1

#example1= scatter plot
ggplot(data=df1, aes(x= age, y= height))+
  geom_point()

#example2= line plot
ggplot(data=df1, aes(x= age, y= height))+
  geom_line()

tibble(age= c(12, 21, 32, 43, 11),
       height= c(160, 150, 149, 123, 170),
       name= c("a", "b", "c", "d", "e"))->df2

#example3= bar plot(categorial varibale)
ggplot(data=df2, aes(x= name, y= height))+
  geom_bar(stat= "identity")

ggplot(data=df2, aes(x= age, y= height))+
  geom_line()
read_csv("sample_sales_data.csv")->sample_sales
sample_sales

ggplot(data=sample_sales, aes(x= Product, y= Quantity))+
  geom_bar(stat= "identity")
ggplot(data=sample_sales, aes(x= Product, y= UnitPrice))+
  geom_bar(stat= "identity")

ggplot(data=sample_sales, aes(x= Product, y= Quantity))+
  geom_line()


ggplot(data=mtcars, aes(x= disp, y=hp) )

#similar pipe opearaotor + works here
ggplot(data=mtcars, aes(x= disp, y=hp) )+
  geom_point()


#histogram - gives how much values/data fall in b/w range given like 0-5, 5-10...
##example4= histogram plot 

ggplot(data=mtcars, aes(x= mpg))+
  geom_histogram(binwidth = 2)

#tibble(name= c("ravi", "ram", "sunil", "pramod"),
#       marks)

#title and axis lables

ggplot(data=mtcars, aes(x= wt, y=mpg) )+
  geom_point()+
  labs(title = "Mileage vs Weight", x= "weight", y= "Miles per Gallon")

#adding subtitle and caption

iris
ggplot(data=iris, aes(x= Sepal.Length, y= Sepal.Width) )+
  geom_point()+
  labs(title = "Sepal Dimensions", subtitle = "Grouped by subspecies",
       caption = "Sorce: iris dataset")


#use a theme


sample_sales %>% colnames()

ggplot(sample_sales, aes(x= UnitPrice, y= TotalPrice, colour = Product, shape = Product))+
  geom_point()

#cahnge size by varibale 

ggplot(data = mtcars, aes(x= wt, y= mpg, size = hp))+
  geom_point()

ggplot(data = mtcars, aes(x= wt, y= mpg))+
  geom_point(size= 3, shape= 4)

ggplot(data = mtcars, aes(x= wt, y= mpg))+
  geom_point(size= 4, shape= 1)+
  geom_line(size= 1)

ggplot(data = mtcars, aes(x= wt, y= mpg))+
  geom_point(size= 4, shape= 1)+
  geom_line(size= 1)+
  theme_minimal()

ggplot(data = mtcars, aes(x= wt, y= mpg))+
  geom_point(size= 4, shape= 1)+
  geom_line(size= 1)+
  theme_classic()

ggplot(data = mtcars, aes(x= wt, y= mpg))+
  geom_point(size= 4, shape= 1)+
  geom_line(size= 1)+
  theme_void()

#use shape aesthatic
ggplot(data=iris, aes(x= Sepal.Length, y= Sepal.Width,
                      shape = Species) )+
  geom_point()
#

##additional modifications

ggplot(sample_sales, aes(x= UnitPrice, y= TotalPrice, colour = Product, shape = Product))+
  geom_point()

ggplot(sample_sales, aes(x= UnitPrice, y= TotalPrice, colour = Product))+
  geom_point(size= 4)

#using hex codes from google manually changing colors
ggplot(sample_sales, aes(x= UnitPrice, y= TotalPrice, colour = Status, shape = Product))+
  geom_point(size= 3)+
  scale_color_manual(values =c("#ffcbd1", "#f69697", "#f94449"))
getwd()

#using status color brewer
ggplot(sample_sales, aes(x= UnitPrice, y= TotalPrice, colour = Status, shape = Product))+
  geom_point(size= 3)+
  scale_color_brewer(palette = "set2")

##facetting 

ggplot(sample_sales, aes(x= UnitPrice, y= TotalPrice, colour = Status, shape = Product))+
  geom_point(size= 3)+
  scale_color_brewer(palette = "set2")+
  facet_wrap(~Status)+
  theme(legend.position= "top")

ggplot(sample_sales, aes(x= UnitPrice, y= TotalPrice, colour = Status, shape = Product))+
  geom_point(size= 3)+
  scale_color_brewer(palette = "set2")+
  facet_grid(Product ~ Status)+
  theme(legend.position= "top")


ggplot(sample_sales, aes(x= UnitPrice, y= TotalPrice))+
  geom_point(size= 3)+
  labs(title = "Price Comparison")+
  scale_color_brewer(palette = "set2")+
  facet_grid(Product ~ Status)+
  theme(legend.position= "top")


ggplot(sample_sales, aes(x= UnitPrice, y= TotalPrice, colour = Status, shape = Product))+
  geom_point(size= 3)+
  scale_color_brewer(palette = "set2")+
  facet_grid(Status ~ Product)+
  theme(legend.position= "top")

#to remove legenf use -theme(legend.position= "none")
ggplot(sample_sales, aes(x= UnitPrice, y= TotalPrice, colour = Status, shape = Product))+
  geom_point(size= 3)+
  scale_color_brewer(palette = "set2")+
  facet_grid(Product ~ Status)+
  theme(legend.position= "none")

##sacle color gradient
ggplot(data = mtcars, aes(x= wt, y= mpg, colour = hp))+
  geom_point(size= 4)+
  scale_color_gradient(low = "yellow", high = "red")


##geom boxplot
ggplot(data=iris, aes(x= Species, y= Sepal.Length, 
                      fill = Species) )+
  geom_boxplot()+
  scale_fill_manual(values = c("setosa" = "red",
                               "versicolor" = "blue",
                               "virginica" = "yellow"))





## to modify x and y axis
ggplot(sample_sales, aes(x= UnitPrice, y= TotalPrice))+
  geom_point(size= 3)+
  xlim(250,500)+
  ylim(0, 2000)

#breaks
ggplot(sample_sales, aes(x= UnitPrice, y= TotalPrice))+
  geom_point(size= 3)+
  scale_x_continuous(breaks = seq(250, 500, by= 25),
                     limits = c(250, 500))


ggplot(sample_sales, aes(x= UnitPrice, y= TotalPrice))+
  geom_point(size= 3)+
  scale_x_continuous(breaks = seq(250, 500, by= 25),
                     limits = c(250, 500))+
  scale_y_continuous(breaks = seq(2000, 5000, by= 250),
                     limits = c(2000, 5000))
tibble(name= c("ram", "ravi", "sunil", "pramod"),
       marks= c(36, 85, 99, 85),
       weight= c(65, 66, 70, 85))->std1
std1
ggplot(std1, aes(x= name, y= marks))+
  geom_point()+
  geom_histogram(stat = "identity")


##class assignment 
students <- tibble(
  Name = c("Asha", "Ben", "Chitra", "Dev", "Esha", "Farhan", "Geeta", "Hari", "Isha", "Jay"),
  Gender = c("F", "M", "F", "M", "F", "M", "F", "M", "F", "M"),
  Score = c(78, 85, 69, 92, 88, 76, 83, 95, 70, 80),
  Hours = c(5, 7, 4, 9, 6, 5, 8, 10, 3, 6),
  Department = c("Math", "Science", "Math", "Math", "Science", "Science", "Math", "Science", "Math", "Science")
)

##task 1
# Plot score vs Hours with both points and a line
ggplot(students, aes(x= Score, y= Hours))+
  geom_line()+
  geom_point()

#faceted by dept and color by gender
ggplot(students, aes(x= Score, y= Hours, colour = Gender))+
  geom_point(size= 3)+
  facet_wrap("Department")
# add proper titles and remove the legend line
ggplot(students, aes(x= Score, y= Hours, colour = Gender))+
  geom_line()+
  geom_point(size= 3)+
  facet_wrap("Department")+
  labs(title = "Student Details")+
  theme(legend.position= "none")+
  theme_gray()
  

##task 2
#color shows Gender 
#size shoes Score
#shape shows dept
#add title, subtitle, and axis lables.
#make it clean and readable

ggplot(students, aes(x= Score, y= Hours, colour = Gender, size = Score, shape = Department))+
  geom_point()+
  facet_grid(Department~Gender)+
  labs(title = "Student Details", subtitle = "Scores in 2 Departments",caption = "source: academic details", 
       x= "Score of Students", y= "Hours spent")+
  theme(legend.position = "none")
  






