idf_component_register(SRCS "main.c" "labP1-3.1.s"
                       PRIV_REQUIRES spi_flash 
                       PRIV_REQUIRES esp_driver_gpio
                       INCLUDE_DIRS ".")
