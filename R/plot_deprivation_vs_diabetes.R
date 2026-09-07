#-----------------------------------------------R Script Visual Code in Power Bi-----------------------------------------------

library(ggplot2)
library(ggrepel)
library(ggpubr)
highlighted<- c("Lewisham"="black", "North Somerset"="red", "Harrow"="blue")
h1<- dataset[dataset$Area_Name %in% names(highlighted),]
 ggplot(dataset, aes(x = IMD_Average_Score, y = Diabetes_Prevalence)) +
  geom_point(aes(color = factor(IMD_Decile)), alpha = 0.7, size = 2.5) +
  geom_smooth(method = "lm", color = "black", se = TRUE, linetype = "dashed") +
  scale_color_viridis_d(name = "IMD Decile\n(1 = Most Deprived)") +
  # Highlight Lewisham
  {if (nrow(h1)>0) list(
  geom_point(data = h1, color = highlighted[h1$Area_Name], size = 4),
  ggrepel::geom_text_repel(data = h1, aes(label= Area_Name), color = highlighted[h1$Area_Name], fontface = "bold", show.legend = FALSE)
  )}+
 {if (nrow(dataset) > 2) 
  stat_cor(method = "pearson", label.x.npc = "left", label.y.npc = "top") 
  }+
  labs(
    x = "IMD 2025 Average Score (Higher = More Deprived)",
    y = "Diabetes QOF Prevalence (%)",
    caption = "Data Sources: NHS Digital QOF 2024/25 & MHCLG IMD 2025"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    legend.position = "bottom"
  )
