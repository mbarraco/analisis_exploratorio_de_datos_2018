library(functional)

#  Set working directory
setwd("~/Dropbox/Exactas/2018_analisis_exploratorio/analisis_exploratorio_de_datos_2018")

#  Load data
file_path = "datos/estad_descriptiva.txt"
data = read.table(
  file=file_path,
  sep="" ,
  header=T,
  nrows =100,
  na.strings ="",
  stringsAsFactors=F
)

#  Helper functions

print_column_operation = function(op_name, data) {
  print(op_name)
  print(toString(data))
}

#  Item b
data_mean = apply(data, 2, mean)
print('mean')
print(toString(data_mean))

alpha = .1
data_mean_alpha = apply(data, 2, mean, trim=alpha)
print(sprintf('Trimmed mean: %g', alpha))
print(toString(data_mean_alpha))
alpha=.6
data_mean_alpha = apply(data, 2, mean, trim=alpha)
print(sprintf('Trimmed mean: %g', alpha))
print(toString(data_mean_alpha))

data_median = apply(data, 2, median)
print('median')
print(toString(data_median))


#  Item c

data_std = apply(data, 2, sd)
data_iqr = apply(data, 2, IQR)

print_column_operation('std', data_std)
print_column_operation('iqr', data_iqr)



apply(data, 2, quantile, x=data, probs=c(.1, 0.25, .5, .75), names=TRUE, type=7)



