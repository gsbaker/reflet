import { Controller } from "@hotwired/stimulus"
import Cropper from "cropperjs";

// Connects to data-controller="avatar"
export default class AvatarController extends Controller {
  connect() {
    this.cropper = new Cropper("#avatar");
  }
}
