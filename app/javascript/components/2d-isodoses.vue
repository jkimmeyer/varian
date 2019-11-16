<template>
  <div class="2d-isodoses">
    <canvas id="maincanvas" width="600" height="600"></canvas>
    <div class="slidercontainer">
       <b-field label="Simple">
          <b-slider :min="1" :max="this.bitmapLength" v-model="sliderValue" @input="loadImageToCanvas()"></b-slider>
        </b-field>
        <p>Value: {{ this.sliderValue }}</p>
    </div>
  </div>
</template>
<script>
  import { getCurrentTreatmentPlan } from '../api/patients'

  export default {
    name: 'v-2d-isodoses',
    props: {
      patientId: {
        type: Number,
        default: 0,
      }
    },
    data() {
      return {
        bitmaps: [],
        bitmapLength: 0,
        sliderValue: 1,
      };
    },
    mounted () {
      this.loadImageToCanvas();
    },
    async beforeMount() {
      let treatmentPlan = await getCurrentTreatmentPlan(this.patientId);
      this.bitmaps = treatmentPlan.data.bitmaps;
      this.bitmapLength = treatmentPlan.data.bitmaps.length;
    },
    methods: {
      loadImageToCanvas: function () {
        var canvas = document.getElementById('maincanvas');
        var context = canvas.getContext('2d');

        // load image from data url
        var imageObj = new Image();

        imageObj.src = this.bitmaps[this.sliderValue - 1];

        imageObj.onload = function() {
          context.drawImage(this, 0, 0);
        };
      }
    }
  }
</script>
