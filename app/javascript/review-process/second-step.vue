<template>
  <div class="review-step">
    <h1 class="title has-text-centered">Organ Countouring</h1>
    <div class="side">

    </div>
    <div class="model">
      <b-table :data="data" focusable>
        <template slot-scope="props">
          <b-table-column field="name" label="Name" sortable>
            {{ props.row.name }}
          </b-table-column>

          <b-table-column field="maxDose" label="Max. Dose" numeric sortable>
            {{ props.row.maxDose }}
          </b-table-column>

          <b-table-column field="minDose" label="Min. Dose" numeric sortable>
                {{ props.row.minDose }}
          </b-table-column>

          <b-table-column field="meanDose" label="Mean Dose" numeric sortable>
              {{ props.row.meanDose }}
          </b-table-column>

          <b-table-column field="perProtocol" label="Standard" numeric sortable>
              {{ props.row.perProtocol }}
          </b-table-column>
      </template>
      </b-table>
      <b-button type="is-primary" @click="sendComment(comment)"> Add Comment</b-button>
    </div>
  </div>
</template>

<script>
import { postReview } from "../api/patients.js"

export default {
  name: "the-second-step",
  components: {
  },
  data () {
    return {
      data: {},
      comment: "",
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
      required: true,
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
