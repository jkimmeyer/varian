<template>
  <section class="section">
    <div class="side">
      <p style="padding-bottom: 10px;">
        <strong style="color: #ff2e2e">PTV_50.4</strong></br>
        Seems slightly to high, please have a look!
      </p>
      <p style="padding-bottom: 10px;">
        <strong style="color: #dbc900">Body</strong></br>
        Totally fine.
      </p>
      <h4>Add a comment to {{ selected.name }}</h4>
      <b-input type="textarea" :maxlength="200"></b-input>
      <b-button type="is-primary" @click="sendComment(comment, selected.id)"> Add Comment</b-button>
    </div>
    <div class="model column">
      <b-table :data="data" focusable :selected.sync="selected">
        <template slot-scope="props">
          <b-table-column field="name" label="Name" sortable>
            {{ props.row.name }}
          </b-table-column>
          <b-table-column field="maxDose" :class="props.row.maxDose.split(' ')[0] > 60 ? 'is-ok': null" label="Max. Dose" numeric sortable>
            {{ props.row.maxDose }}
          </b-table-column>

          <b-table-column field="minDose" :class="props.row.minDose.split(' ')[0] > 0.8 ? 'is-ok': null" label="Min. Dose" numeric sortable>
            {{ props.row.minDose }}
          </b-table-column>

          <b-table-column field="meanDose" :class="props.row.meanDose.split(' ')[0] > 60 ? 'is-bad': null" label="Mean Dose" numeric sortable>
            {{ props.row.meanDose }}
          </b-table-column>

          <b-table-column field="perProtocol" label="Standard" numeric sortable>
            {{ props.row.perProtocol }}
          </b-table-column>
      </template>
      </b-table>
    </div>
  </section>
</template>

<script>
import { postReview } from "../api/patients.js"

export default {
  name: "the-fourth-step",
  components: {
  },
  data () {
    return {
      data: {},
      comment: "",
      selected: {},
    }
  },
  props: {
    patientId: {
      type: Number,
      default: null,
    },
    treatmentPlan: {
      type: Object,
      default: {},
    }
  },
  created () {
    let dhvCurves = this.treatmentPlan.dvhCurves.map(function (curve) {
      return {
        "maxDose": curve.maxDose + " Gy",
        "minDose": curve.minDose + " Gy",
        "meanDose": curve.meanDose + " Gy",
        "name": curve.name,
        "perProtocol": [curve.maxDose, curve.minDose, curve.meanDose][Math.floor(Math.random() * 3)] * 1.10 + " Gy",
      }
    });

    let beams = this.treatmentPlan.beams.map (function (beam) {
      return {
        "monitorUnits": beam.monitorUnits
      }
    });
    this.data = dhvCurves;
  },
  methods: {
    sendComment: function (payload) {
      postReview('comments', payload);
    }
  }
}
</script>

<style lang="scss">
  .is-bad {
    background-color: rgba(red, 0.3);
  }
  .is-ok {
    background-color: rgba(yellow, 0.3);
  }
</style>
