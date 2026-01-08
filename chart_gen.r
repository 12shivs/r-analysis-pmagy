# import packages
library(readxl)
library(ggplot2)
library(gridExtra)
library(dplyr)

post_pmagy_file_path <- "/home/shivs/r-analysis-pmagy/post_pmagy.xlsx"
pre_hn_file_path<-"/home/shivs/r-analysis-pmagy/pre_pmagy_obj3_hn.xlsx"
pre_edu_file_path<-"/home/shivs/r-analysis-pmagy/pre_pmagy_obj3_edu.xlsx"
pre_lisd_file_path<-"/home/shivs/r-analysis-pmagy/pre_pmagy_obj4_lisd.xlsx"

pmagy_POST <-read_excel(post_pmagy_file_path,sheet = "Sheet1")


# edu_PRE_w_index <- read_excel("/home/shivs/r-analysis-pmagy/pre_pmagy_obj3_edu.xlsx",range = "A1:K487")
# inds<-dplyr::pull(edu_PRE_w_index,EDU_INDEX)
# qqnorm(inds)
# qqline(inds, col = "blue")

#Variance Inflation Factor (VIF):
library(car)
library(caTools)

#
# # Fit a regression model on post data
# edu_POST_w_index <-data.frame(read_excel(post_pmagy_file_path,sheet = "Sheet1",range = "AE1:AO487"))
# colnames(edu_POST_w_index) <- paste('POST', colnames(edu_POST_w_index), sep = '_')
# model_all <- lm(POST_EDU_INDEX ~ ., data = edu_POST_w_index)
# # Calculate VIF
# vif_results <- car::vif(model_all)

# print("VIF results for post data:")
# print(vif_results)
# # make a chart
# # Convert VIF results to a data frame for plotting
# vif_df <- data.frame(Variable = names(vif_results), VIF = vif_results)

# # Set a threshold to indicate high VIF
# high_vif_threshold <- 5
#
# # Create a ggplot bar plot to visualize VIF values
# ggplot(vif_df, aes(x = Variable, y = VIF)) +
#   geom_bar(stat = "identity", fill = "steelblue") +
#   geom_hline(yintercept = high_vif_threshold, linetype = "dashed", color = "red") +
#   scale_y_continuous(limits = c(0, max(vif_df$VIF) + 1)) +
#   labs(title = "Variance Inflation Factor (VIF) for Regression Model",
#        y = "VIF",
#        x = "Variable") +
#   theme_minimal() +
#   theme(axis.text.x = element_text(angle = 45, hjust = 1))
#


#
# edu_POST_w_index <-read_excel(post_pmagy_file_path,sheet = "Sheet1",range = "AE1:AO487")
# colnames(edu_POST_w_index) <- paste('POST', colnames(edu_POST_w_index), sep = '_')
# edu_PRE_w_index <-read_excel("/home/shivs/r-analysis-pmagy/pre_pmagy_obj3_edu.xlsx",range = "A1:K487")
# colnames(edu_PRE_w_index) <- paste('PRE', colnames(edu_PRE_w_index), sep = '_')
#hist(edu_PRE_w_index$PRE_EDU_INDEX, col='coral2')
#hist(edu_POST_w_index$POST_EDU_INDEX, col='coral2')
#


#
# hn_POST_w_index <-data.frame(read_excel(post_pmagy_file_path,sheet = "Sheet1",range = "AP1:AY487"))
# colnames(hn_POST_w_index) <- paste('POST', colnames(hn_POST_w_index), sep = '_')

# hn_PRE_w_index <-data.frame(read_excel("/home/shivs/r-analysis-pmagy/pre_pmagy_obj3_hn.xlsx",range = "A1:J487"))
# colnames(hn_PRE_w_index) <- paste('PRE', colnames(hn_PRE_w_index), sep = '_')

#hist(hn_PRE_w_index$PRE_HN_INDEX, col='coral2')
#hist(hn_POST_w_index$POST_HN_INDEX, col='coral2')
#



#
# lisd_POST_w_index <-data.frame(read_excel(post_pmagy_file_path,sheet = "Sheet1",range = "CJ1:CO487"))
# colnames(lisd_POST_w_index) <- paste('POST', colnames(lisd_POST_w_index), sep = '_')

# lisd_PRE_w_index <-data.frame(read_excel("/home/shivs/r-analysis-pmagy/pre_pmagy_obj4_lisd.xlsx",range = "A1:F487"))
# colnames(lisd_PRE_w_index) <- paste('PRE', colnames(lisd_PRE_w_index), sep = '_')


#hist(lisd_PRE_w_index$PRE_LISD_INDEX, col='coral2')
#hist(lisd_POST_w_index$POST_LISD_INDEX, col='coral2')
#




# hn_POST_w_index <-data.frame(read_excel(post_pmagy_file_path,sheet = "Sheet1",range = "AP1:AY487"))
# colnames(hn_POST_w_index) <- paste('POST', colnames(hn_POST_w_index), sep = '_')

# hn_PRE_w_index <-data.frame(read_excel("/home/shivs/r-analysis-pmagy/pre_pmagy_obj3_hn.xlsx",range = "A1:J487"))
# colnames(hn_PRE_w_index) <- paste('PRE', colnames(hn_PRE_w_index), sep = '_')

# hn_pre_post_w_index_hcomb <- cbind(hn_PRE_w_index, hn_POST_w_index)

# boxplot(hn_PRE_w_index$PRE_HN_INDEX ~ hn_POST_w_index$POST_HN_INDEX,
# data = hn_pre_post_w_index_hcomb,
# main = "...",
# xlab = "POST_HN_INDEX",
# ylab = "PRE_HN_INDEX",
# col = "steelblue",
# border = "black")





# edu_POST_w_index <-data.frame(read_excel(post_pmagy_file_path,sheet = "Sheet1",range = "AE1:AO487"))
# colnames(edu_POST_w_index) <- paste('POST', colnames(edu_POST_w_index), sep = '_')

# edu_PRE_w_index <-data.frame(read_excel("/home/shivs/r-analysis-pmagy/pre_pmagy_obj3_edu.xlsx",range = "A1:K487"))
# colnames(edu_PRE_w_index) <- paste('PRE', colnames(edu_PRE_w_index), sep = '_')

# edu_pre_post_w_index_hcomb <- cbind(edu_PRE_w_index, edu_POST_w_index)

# boxplot(edu_pre_post_w_index_hcomb$PRE_EDU_INDEX ~ edu_pre_post_w_index_hcomb$POST_EDU_INDEX,
# data = edu_pre_post_w_index_hcomb,
# main = "...",
# xlab = "POST_EDU_INDEX",
# ylab = "PRE_EDU_INDEX",
# col = "steelblue",
# border = "black")






# lisd_POST_w_index <-data.frame(read_excel(post_pmagy_file_path,sheet = "Sheet1",range = "CJ1:CO487"))
# colnames(lisd_POST_w_index) <- paste('POST', colnames(lisd_POST_w_index), sep = '_')

# lisd_PRE_w_index <-data.frame(read_excel("/home/shivs/r-analysis-pmagy/pre_pmagy_obj4_lisd.xlsx",range = "A1:F487"))
# colnames(lisd_PRE_w_index) <- paste('PRE', colnames(lisd_PRE_w_index), sep = '_')

# lisd_pre_post_w_index_hcomb <- cbind(lisd_PRE_w_index, lisd_POST_w_index)

# boxplot(lisd_pre_post_w_index_hcomb$PRE_LISD_INDEX ~ lisd_pre_post_w_index_hcomb$POST_LISD_INDEX,
# data = lisd_pre_post_w_index_hcomb,
# main = "...",
# xlab = "POST_LISD_INDEX",
# ylab = "PRE_LISD_INDEX",
# col = "steelblue",
# border = "black")

# vec<-dplyr::pull(pmagy_POST, "DI.1..GENDER")
# gen_count <- c(
#     sum(vec == "Male")  

# ,

#     sum(vec == "Female")  
# )
# labels <- c("Male", "Female")

# piepercent<- round(100 * gen_count / sum(gen_count), 1)

# pie(gen_count, labels = piepercent,
#     main = "...", col = rainbow(length(gen_count)))
#     legend("topright", c("Male", "Female"),
#                     cex = 0.5, fill = rainbow(length(gen_count)))


# age,, ed qual, primary occ, annual inc, di8, di10, di11 pie charts

# table(pmagy_POST$DI.2...AGE)
# # 60 18-30 31-40 41-50 51-60 
# # 8   204   148    61    65 

# geeks <- c(8   ,204   ,148    ,61   ,65 )
# labels <- c("60","18-30","31-40","41-50", "51-60")

# piepercent<- round(100 * geeks / sum(geeks), 1)

# pie(geeks, labels = piepercent,
#     main = "...", col = rainbow(length(geeks)))
#     legend("topright", labels,
#                     cex = 0.5, fill = rainbow(length(geeks)))


# table(pmagy_POST$DI.4...EDUCATION.QUALIFICATION)
# # Diploma Graduate and Above   Higher Secondary         Illiterate          Secondary 
# #                 17                191                148                 61                 69 

# geeks <- c(17         ,       191      ,          148         ,        61        ,         69 )
# labels <- c("Diploma Graduate and Above"  , "Higher Secondary"   ,     "Illiterate"       ,   "Secondary" )

# piepercent<- round(100 * geeks / sum(geeks), 1)

# pie(geeks, labels = piepercent,
#     main = "...", col = rainbow(length(geeks)))
# legend("topright", labels,
#        cex = 0.5, fill = rainbow(length(geeks)))



# table(pmagy_POST$DI.5..PRIMARY.OCCUPATION)
# #  agriculture                  labour        self employed/ business          unemployed/ not working 
# #        299                     141                      34                      12 

# geeks <- c( 299            ,         141             ,         34          ,            12 )
# labels <- c("agriculture"         ,         "labour"    ,    "self employed/ business"      ,    "unemployed/ not working")

# piepercent<- round(100 * geeks / sum(geeks), 1)

# pie(geeks, labels = piepercent,
#     main = "...", col = rainbow(length(geeks)))
#     legend("topright", labels,
#                     cex = 0.5, fill = rainbow(length(geeks)))
# # 1116 586



# table(pmagy_POST$DI.6..ANNUAL.INCOME.OF.THE.HOUSEHOLD)
# #  25,000 Rupees        > 75,000   25,000-50,000   50,000-75,000       no income 
# #              10             258              77             137               4 

# geeks <- c(  10      ,       258        ,      77     ,        137   ,            4 )
# labels <- c("25,000 Rupees"     ,   "> 75,000"  , "25,000-50,000"  , "50,000-75,000"    ,   "No income")

# piepercent<- round(100 * geeks / sum(geeks), 1)

# pie(geeks, labels = piepercent,
#     main = "...", col = rainbow(length(geeks)))
#     legend("topright",  c("25,000 Rupees"     ,   "> 75,000"  , "25,000-50,000"  , "50,000-75,000"    ,   "No income"),
#                     cex = 0.5, fill = rainbow(length(geeks)))
# # 1116 586


# table(pmagy_POST$DI.8...If.yes..source.of.information.about.PMAGY.)
# # family/friends/fellow villagers                  Gram Panchayat                       newspaper            Radio and Television 
# #                       95                             331                              17                              43 

# geeks <- c(  95            ,                 331        ,                      17           ,                   43 )
# labels <- c("family/friends/fellow villagers"                  ,"Gram Panchayat"              ,         "newspaper"        ,    "Radio and Television")

# piepercent<- round(100 * geeks / sum(geeks), 1)

# pie(geeks, labels = piepercent,
#     main = "...", col = rainbow(length(geeks)))
#     legend("topright", labels,
#                     cex = 0.5, fill = rainbow(length(geeks)))
# # 1116 586



# table(pmagy_POST$DI.10...To.what.extent.do.you.feel.more.included.in.the.village.s.decision.making.processes.after.the.implementation.of.PMAGY.)
# # completely included     mostly included   Slightly included   somewhat included 
# #                 364                  61                   8                  53 

# geeks <- c(364          ,        61          ,         8          ,        53 )
# labels <- c("completely included",     "mostly included",   "Slightly included",   "somewhat included")

# piepercent<- round(100 * geeks / sum(geeks), 1)

# pie(geeks, labels = piepercent,
#     main = "...", col = rainbow(length(geeks)))
#     legend("topright", labels,
#                     cex = 0.5, fill = rainbow(length(geeks)))
# # 1116 586


table(pmagy_POST$DI.11...What.change.have.you.noticed.in.the.treatment.of.Scheduled.Castes.in.your.village.since.PMAGY.)
# dont know/ no opinion     major improvement             no change      some improvement 
#                    28                   400                    11                    47 

geeks <- c( 28,                   400,                    11,                    47 )
labels <- c("dont know/ no opinion",     "major improvement",             "no change",      "some improvement" )

piepercent<- round(100 * geeks / sum(geeks), 1)

pie(geeks, labels = piepercent,
    main = "...", col = rainbow(length(geeks)))
    legend("topright", labels,
                    cex = 0.5, fill = rainbow(length(geeks)))
# 1116 586