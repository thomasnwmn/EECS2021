#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"
#include "esp_log.h"
#include "led_strip.h"
#include "sdkconfig.h"

#define BLINK_GPIO 8

static led_strip_handle_t led_strip;

extern int compute_neuron(void);
extern int result;

void app_main(void)
{
    led_strip_config_t strip_config = {
        .strip_gpio_num = BLINK_GPIO,
        .max_leds = 1,
    };
    led_strip_rmt_config_t rmt_config = {
        .resolution_hz = 10 * 1000 * 1000,
        .flags.with_dma = false,
    };

    ESP_ERROR_CHECK(led_strip_new_rmt_device(&strip_config, &rmt_config, &led_strip));
    ESP_ERROR_CHECK(led_strip_clear(led_strip));

    int y_final = compute_neuron();
    int y_raw   = result;

    if (y_raw & 1) {
        printf("The given input is ODD number\n");
    } else {
        printf("The given input is EVEN number\n");
    }

    for (int i = 0; i < y_final; i++) {
        led_strip_set_pixel(led_strip, 0, 255, 255, 0);  // Yellow ON
        led_strip_refresh(led_strip);
        vTaskDelay(300 / portTICK_PERIOD_MS);

        led_strip_set_pixel(led_strip, 0, 0, 0, 0);  // OFF
        led_strip_refresh(led_strip);
        vTaskDelay(300 / portTICK_PERIOD_MS);
    }

    printf("The output of the neuron is: %d\n", y_final);

    while (1) {
        vTaskDelay(portMAX_DELAY);
    }
}
