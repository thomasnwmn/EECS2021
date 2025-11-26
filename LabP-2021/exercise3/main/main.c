#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"
#include "esp_log.h"
#include "led_strip.h"
#include "sdkconfig.h"

# define BLINK_GPIO 8 // GPIO for onboard WS2812 LED

static led_strip_handle_t led_strip;

extern int get_blink_count();

void app_main () {
    led_strip_config_t strip_config = {
        .strip_gpio_num = BLINK_GPIO,
        .max_leds = 1,
    };
        led_strip_rmt_config_t rmt_config = {.resolution_hz = 10*1000*1000, .flags.with_dma = false,
    };
    ESP_ERROR_CHECK(led_strip_new_rmt_device(&strip_config, &rmt_config, &led_strip));
    ESP_ERROR_CHECK(led_strip_clear(led_strip));
    int n = get_blink_count();
    for (int i = 0; i < n; i++) {
        led_strip_set_pixel(led_strip, 0, 0, 0, 255); // Blue
        led_strip_refresh(led_strip);
        ESP_LOGI("example","Turning the LED on!");
        vTaskDelay(500/portTICK_PERIOD_MS ) ;
        led_strip_set_pixel(led_strip, 0, 0, 0, 0); // OFF
        led_strip_refresh(led_strip);
        ESP_LOGI("example","Turning the LED off!");
        vTaskDelay(500/portTICK_PERIOD_MS);
    }
}