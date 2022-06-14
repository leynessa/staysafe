import { Controller } from "@hotwired/stimulus"
import mapboxgl from "!mapbox-gl"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"
import MapboxDirections from '@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions'




export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;




    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  this.#addDirectionToMap()
  this.#addsearchbar()


  }
  #addDirectionToMap() {
    const directions = new MapboxDirections({
      accessToken: mapboxgl.accessToken,
      unit: 'metric',
      profile: 'mapbox/driving',
      alternatives: 'false',
      geometries: 'geojson'
    });
   this.map.addControl(directions, 'top-left')
  }
  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)
      new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(this.map)

    });
  }
  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

#addsearchbar(){
  const geocoder = new MapboxGeocoder({
    accessToken: mapboxgl.accessToken,
    mapboxgl: mapboxgl,

    zoom: 15,
  })
 this.map.addControl(geocoder);
 geocoder.addTo('#geocoder');
 document.getElementById('geocoder').appendChild(this.geocoder.onAdd(map))
}
};
