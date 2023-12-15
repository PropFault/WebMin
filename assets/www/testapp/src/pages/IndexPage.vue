<template>
  <q-page>
    <div
      class="col column-grow-overflow-hidden justify-center base-chat-mobile"
      style="
        background-repeat: repeat;
        background-size: 600px;
        background-color: var(--q-grey1);
        height: calc(100% - 3.692rem - 1px);
      "
    >
      <div class="flex justify-center">
        <span class="text-bold q-pt-sm">{{ 'Test' }}</span>
      </div>

      <div
        class="bg-light-dark absolute-bottom base-chat-write-message-container"
      >
        <div class="row items-center flex">
          <div class="">
            <div class="q-my-auto q-ml-md q-py-md" style="position: relative">
              <span>{{ 'Documents' }} </span>
              <q-btn
                class="q-ml-md"
                outline
                text-color="dark-light"
                padding="0"
                @click="
                  {
                  }
                "
                icon="clear"
                style="background: var(--q-light-dark) !important"
              ></q-btn>
            </div>
          </div>
        </div>
        <div class="row q-pr-md items-start">
          <div class="col-auto column" style="height: 3.692rem">
            <q-btn
              flat
              dense
              @click.stop
              icon="add"
              font-size="1.846rem"
              padding="8px"
              class="q-my-auto q-ml-sm"
            >
            </q-btn>
          </div>
          <div class="col base-chat-text-input-field-blinking q-my-auto">
            <q-input
              v-model="msgContent"
              dense
              borderless
              class="q-px-sm col base-chat-text-input-field"
              autogrow
            />
            <i />
          </div>
          <div class="col-auto column" style="height: 3.692rem">
            <q-btn icon="navigation" />
          </div>
        </div>
      </div>
    </div>
  </q-page>
</template>
<script setup>
let msgContent = '';
</script>

<style scoped lang="scss">
.base-chat-message :deep(.base-list-searchbar .search-input) {
  background-color: var(--q-light-dark);
}

.base-chat-message :deep(.base-list-searchbar) {
  padding: var(--q-sm) var(--q-xl) 0;
  max-width: 800px;
  margin: 0 auto;
}

@media screen and (max-width: 1023px) {
  .base-chat-message :deep(.base-list-searchbar) {
    padding: var(--q-xs) var(--q-md) 0;
  }
}

.message-load-next :deep(.q-icon) {
  margin-right: 4px;
}

.base-chat-text-input-field-blinking {
  position: relative;
  display: flex;
}

.base-chat-text-input-field-blinking i {
  position: absolute;
  width: 1px;
  height: 1.2rem;
  background-color: black;
  left: 8px;
  top: calc(50% - 0.6rem);
  animation-name: blink;
  animation-duration: 940ms;
  animation-iteration-count: infinite;
  opacity: 1;
}

.base-chat-text-input-field-blinking .q-field--focused + i {
  display: none !important;
}

@keyframes blink {
  from {
    opacity: 1;
  }
  to {
    opacity: 0;
  }
}

:deep(.q-message) {
  max-width: 736px;
  margin-right: auto;
  margin-left: auto;
}

.drawer-right-menu .base-chat-write-message-container {
  left: 1px;
}
.drawer-right-menu .base-chat-message :deep(.base-list-searchbar) {
  padding: var(--q-sm) var(--q-md) 0;
}

.base-chat-mobile :deep(.base-chat-message .base-list-searchbar) {
  padding: var(--q-lg) var(--q-sm) 0;
}
</style>
