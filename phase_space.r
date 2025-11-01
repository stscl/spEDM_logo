cu = terra::rast("./cu.tif")

m1 = spEDM::embedded(cu,"industry",E = 9,tau = 0,trend.rm = FALSE)
m2 = spEDM::embedded(cu,"cu",E = 9,tau = 0,trend.rm = FALSE)
colnames(m1) = colnames(m2) = paste0("z",1:9)

readr::write_csv(as.data.frame(m1),'./result/phase_space1.csv')
readr::write_csv(as.data.frame(m2),'./result/phase_space2.csv')