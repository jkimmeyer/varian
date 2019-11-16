<template>
    <section>
        <p class="content"><b>To Be Changed</b></p>
        <div v-bind:key="option" v-for="option in selectedOptions">
          <p class="content">{{ option }}
            <b-button type="is-primary">Comment {{ option }}</b-button>
          </p>
        </div>

        <b-field>
            <b-select
                multiple
                native-size="2"
                v-model="selectedOptions">
                <option value="heart">Heart</option>
                <option value="leaver">Leaver</option>
            </b-select>
        </b-field>
    </section>
</template>

<script>
    export default {
        name: 'v-select',
        data() {
            return {
                selectedOptions: []
            }
        }
    }
</script>
