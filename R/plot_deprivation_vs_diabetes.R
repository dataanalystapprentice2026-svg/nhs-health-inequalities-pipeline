#-----------------------------------------------R Script Visual Code in Power Bi-----------------------------------------------

library(ggplot2)
library(ggpubr)
 ggplot(dataset, aes(x = IMD_Average_Score, y = Diabetes_Prevalence)) +
  geom_point(aes(color = factor(IMD_Decile)), alpha = 10, size = 3) +
  geom_smooth(method = "lm", color = "black", se = TRUE, linetype = "dashed") +
  scale_color_viridis_d(name = "IMD Decile\n(1 = Most Deprived)") +
 {if (nrow(dataset) > 2) 
  stat_cor(method = "pearson", label.x.npc = "left", label.y.npc = "top") 
  }+
  labs(
    x = "IMD 2025 Average Score (Higher = More Deprived)",
    y = "Diabetes QOF Prevalence (%)",
    caption = "Data Sources: NHS Digital QOF 2024/25 & MHCLG IMD 2025"
  ) +
  theme_minimal(base_size = 28) +
  theme(
    plot.title = element_text(face = "bold", size = 30),
    legend.position = "right",
    legend.justification = "top"
  )
