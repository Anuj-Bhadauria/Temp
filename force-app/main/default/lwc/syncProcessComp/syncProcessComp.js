import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getCallout from '@salesforce/apex/SyncProcessController.getCallout'; 
export default class SyncProcessComp extends LightningElement {
error;
    handleClick() {
        getCallout()
		.then(result => {          
            this.showToast('success','Process is Successfully Done.');    
			this.error = undefined;
		})
		.catch(error => {
            this.showToast('error','No response.');
			this.error = error;
		})
    }

    showToast(variant,message) {
        const event = new ShowToastEvent({
            title: message,
            message: message,
            variant: variant,
            mode: 'dismissable'
        });
        this.dispatchEvent(event);
    }

}