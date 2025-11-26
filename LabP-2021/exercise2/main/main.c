#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"
#include "esp_log.h"
#include "led_strip.h"
#include "sdkconfig.h"

# define BLINK_GPIO 8 // GPIO for onboard WS2812 LED

static led_strip_handle_t led_strip;

extern void toggle_led();
extern int led_state;

void app_main() {
    led_strip_config_t strip_config = {
        .strip_gpio_num = BLINK_GPIO,
        .max_leds = 1,
    };
        led_strip_rmt_config_t rmt_config = {.resolution_hz = 10*1000*1000, .flags.with_dma = false,
    };
    ESP_ERROR_CHECK(led_strip_new_rmt_device(&strip_config, &rmt_config, &led_strip));
    ESP_ERROR_CHECK(led_strip_clear(led_strip));
    while(1) {
        toggle_led();
        if (led_state) {
            led_strip_set_pixel(led_strip, 0, 0, 255, 0); // Green ON
            ESP_LOGI("example","Turning the LED on!");
        } else {
            led_strip_set_pixel(led_strip, 0, 0, 0, 0); // OFF
            ESP_LOGI("example","Turning the LED off!");
        }
        led_strip_refresh(led_strip);
        vTaskDelay(1000/portTICK_PERIOD_MS);
    }
}